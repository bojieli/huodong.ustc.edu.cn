<?php
/*
 JSON format of a survey form:
 {  title: string,
    help_text: string,
    member_only: bool,
    need_login: bool,
    password: string (optional),
    sections: [
        { title: string,
          help_text: string,
          questions: [
            { title: string,
              help_text: string,
              type: radio/checkbox/select/input/textarea,
              required: bool,
              options: [
                option1, option2, ...
              ]
            }, ...
          ]
        }, ...
    ]
 }

 JSON format of a response form:
 [ [answer-to-sec1-question1, answer-to-sec2-question2, ...], 
   [answer-to-sec2-question1, answer-to-sec2-question2, ...],
   ... ]
 If radio/checkbox/select, answer is the index in options.
 Otherwise answer is the text.
 */
class SurveyModel extends Model {
    function create($gid, $form) {
        $survey['gid'] = $gid;
        $survey['creater'] = CURRENT_USER;
        if (empty($form['title']))
            return false;
        $survey['title'] = $form['title'];
        $survey['help_text'] = $form['help_text'];
        $survey['member_only'] = $form['member_only'] ? true : false;
        $survey['need_login'] = $form['need_login'] ? true : false;
        if (!empty($form['password']))
            $survey['password'] = $form['password'];
        $survey['create_time'] = time();
        $surveyid = $this->add($survey);
        if (!$surveyid)
            return false;

        if (0 == $this->addQuestion($surveyid, $form))
            return false;
        return $surveyid;
    }

    private function addQuestion($surveyid, $form) {
        $qcount = 0;
        foreach ($form['sections'] as $i => $section) {
            $sec = array();
            $sec['survey'] = $surveyid;
            $sec['section'] = $i;
            $sec['title'] = $section['title'];
            if (empty($sec['title']))
                return false;
            $sec['help_text'] = $section['help_text'];
            M('survey_section')->add($sec);

            foreach ($section['questions'] as $j => $question) {
                $q = array();
                $q['survey'] = $surveyid;
                $q['section'] = $i;
                $q['question'] = $j;
                $q['title'] = $question['title'];
                $q['help_text'] = $question['help_text'];
                $q['type'] = $question['type'];
                $q['required'] = $question['required'] ? true : false;
                if ($q['type'] != 'text' && $q['type'] != 'textarea') {
                    $q['options'] = json_encode($question['options']);
                }
                M('survey_question')->add($q);
                $qcount++;
            }
        }
        return $qcount;
    }

    function update($survey, $form) {
        $s['title'] = $form['title'];
        $s['help_text'] = $form['help_text'];
        $s['member_only'] = $form['member_only'] ? true : false;
        $this->where(array('id'=>$survey))->save($s);

        M('survey_section')->where(array('survey'=>$survey))->delete();
        M('survey_question')->where(array('survey'=>$survey))->delete();
        $this->addQuestion($survey, $form);
    }

    function check_response($survey, $form) {
        $questions = M('survey_question')->where(array('survey'=>$survey))->select();
        if (empty($questions))
            return false;

        foreach ($questions as $question) {
            if ($question['required'] && !isset($form[$question['section']][$question['question']]))
                return false;
        }
        return true;
    }

    function isSubmited($survey) {
        return (CURRENT_USER > 0 && (M('survey_response')->where(array('survey'=>$survey, 'uid'=>CURRENT_USER))->count() > 0));
    }

    function response($survey, $form) {
        if ($this->isSubmited($survey))
            throw new Exception("您已经参与过此调查，每人只能参与一次");
        if (! $this->check_response($survey, $form))
            throw new Exception("您填写的问卷有问题，请检查所有必填问题均已正确填写");

        $response['survey'] = $survey;
        $response['uid'] = CURRENT_USER;
        $response['submit_time'] = time();
        $id = M('survey_response')->add($response);
        if (!$id)
            throw new Exception("调查保存失败，请联系管理员");

        foreach ($form as $i => $section) {
            foreach ($section as $j => $content) {
                $row['response'] = $id;
                $row['survey'] = $survey;
                $row['section'] = $i;
                $row['question'] = $j;
                // multiple select questions may have multiple answers
                $contentarr = is_array($content) ? $content : array($content);
                foreach ($contentarr as $value) {
                    $row['content'] = $value;
                    M('survey_response_field')->add($row);
                }
            }
        }
        return $id;
    }

    function getResult($surveyid) {
        return $this->getForm($surveyid, true);
    }

    function getForm($surveyid, /*INTERNAL*/ $getresult=false) {
        $survey = $this->find($surveyid);
        $survey['sections'] = M('survey_section')->where(array('survey'=>$surveyid))->select();
        foreach ($survey['sections'] as $i => &$sec) {
            $sec['question'] = M('survey_question')->where(array('survey'=>$surveyid, 'section'=>$i))->select();
            foreach ($sec['question'] as $j => &$q) {
                $q['options'] = json_decode($q['options']);

                if ($getresult) {
                    $arr = M('survey_response_field')->field('content')->where(array('survey'=>$surveyid, 'section'=>$i, 'question'=>$j))->select();
                    $responses = array();
                    foreach ($arr as $response) {
                        $responses[] = $response['content'];
                    }
                    $q['response_count'] = count($responses);

                    $q['stats'] = array();
                    foreach ($q['options'] as $key => $option) {
                        $q['stats'][$option] = 0;
                    }
                    foreach ($responses as $content) {
                        $q['stats'][$content] ++;
                    }
                }
            }
            unset($q);
        }
        unset($sec);
        return $survey;
    }
}
