<?php
class TestAction extends PublicAction
{
	public function index(){
		$this->display();
	}
	 public function ajax_get(){
        base64String = $this->_post('data');
        Image img = this.Base64ToImage(base64String);
        img.Save(@"D:\ccc.jpg");//����DƬ
	 }
	 public Image Base64ToImage(string base64String)
    {
        // Convert Base64 String to byte[]
        byte[] imageBytes = Convert.FromBase64String(base64String);
        MemoryStream ms = new MemoryStream(imageBytes, 0,
          imageBytes.Length);
 
        // Convert byte[] to Image
        ms.Write(imageBytes, 0, imageBytes.Length);
        Image image = Image.FromStream(ms, true);
        return image;
    }
	
	/*throws ServletException, IOException {
	String imgData = request.getParameter("img");
	//System.out.println("imgData:"+imgData);

	//�����ͼƬ������
	String fileName =System.currentTimeMillis() + ".png";
	//System.out.println("fileName:"+fileName);
	//���picture�ļ�����tomcat�еľ���·��
	String basePath = request.getSession().getServletContext().getRealPath("/picture/");
	String filePath = basePath;
	System.out.println("����ͼƬ�ĵ�ַΪ��"+filePath);
	BASE64Decoder decoder = new BASE64Decoder();
	try {
	byte[] bytes1 = decoder.decodeBuffer(imgData);


	ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
	BufferedImage image = ImageIO.read(bais);
	if (image != null)
	{
	//����ͼƬ��ָ����Ŀ¼���ļ���
	ImageIO.write(image, "png", new File(filePath , fileName));
	}


	} catch (IOException e) {
	e.printStackTrace();
	}
	}*/
}
?>