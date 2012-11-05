<?php
/*
 JSON format of a survey form:
 {  title: string,
    help_text: string,
    member_only: bool,
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
        $survey['title'] = $form['title'];
        $survey['help_text'] = $form['help_text'];
        $survey['member_only'] = $form['member_only'] ? true : false;
        $survey['create_time'] = time();
        $surveyid = $this->add($survey);
        if (!$surveyid)
            return false;

        $this->addQuestion($surveyid, $form);
        return $surveyid;
    }

    private function addQuestion($surveyid, $form) {
        foreach ($form['sections'] as $i => $section) {
            $sec['survey'] = $surveyid;
            $sec['section'] = $i;
            $sec['title'] = $section['title'];
            $sec['help_text'] = $sec['help_text'];
            M('survey_section')->add($sec);

            foreach ($section['questions'] as $j => $question) {
                $q['survey'] = $surveyid;
                $q['section'] = $i;
                $q['question'] = $j;
                $q['title'] = $question['title'];
                $q['help_text'] = $question['help_text'];
                $q['type'] = $question['type'];
                $q['required'] = $question['required'] ? true : false;
                $q['options'] = json_encode($question['options']);
            }
        }
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

    function response($survey, $form) {
        $response['survey'] = $survey;
        $response['uid'] = CURRENT_USER;
        $response['submit_time'] = time();
        $id = M('survey_response')->add($response);
        if (!$id)
            return false;

        foreach ($sections as $i => $section) {
            foreach ($section as $j => $content) {
                $row['response'] = $id;
                $row['survey'] = $survey;
                $row['section'] = $i;
                $row['question'] = $j;
                $row['content'] = $content;
                M('survey_response_field')->add($row);
            }
        }
        return true;
    }

    function getResult($surveyid) {
        $this->getForm($surveyid, true);
    }

    function getForm($surveyid, /*INTERNAL*/ $getresult=false) {
        $survey = $this->find($surveyid);
        $survey['sections'] = M('survey_section')->where(array('survey'=>$surveyid))->select();
        foreach ($survey['sections'] as $i => &$sec) {
            $sec['question'] = M('survey_question')->where(array('survey'=>$surveyid, 'section'=>$i))->select();
            foreach ($sec['question'] as $j => &$q) {
                $q['options'] = json_decode($q['options']);

                if ($getresult) {
                    $responses = M('survey_response_field')->field('content')->where(array('survey'=>$surveyid, 'section'=>$i, 'question'=>$j))->select();
                    $q['responses'] = array();
                    foreach ($responses as $response) {
                        $q['responses'][] = $responses['content'];
                    }

                    $q['stats'] = array();
                    foreach ($q['options'] as $key => $option) {
                        $q['stats'][$option] = 0;
                    }
                    foreach ($q['responses'] as $content) {
                        if (isset($q['options'][$content])) // select question
                            $q['stats'][$q['option'][$content]] ++;
                        else // text question
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
