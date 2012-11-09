<?php
class TestAction extends PublicAction
{
	public function index(){
		$this->display();
	}
	 public function ajax_get(){
        base64String = $this->_post('data');
        Image img = this.Base64ToImage(base64String);
        img.Save(@"D:\ccc.jpg");//儲存圖片
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

	//保存的图片的名称
	String fileName =System.currentTimeMillis() + ".png";
	//System.out.println("fileName:"+fileName);
	//获得picture文件夹在tomcat中的绝对路径
	String basePath = request.getSession().getServletContext().getRealPath("/picture/");
	String filePath = basePath;
	System.out.println("保存图片的地址为："+filePath);
	BASE64Decoder decoder = new BASE64Decoder();
	try {
	byte[] bytes1 = decoder.decodeBuffer(imgData);


	ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
	BufferedImage image = ImageIO.read(bais);
	if (image != null)
	{
	//保存图片到指定的目录和文件中
	ImageIO.write(image, "png", new File(filePath , fileName));
	}


	} catch (IOException e) {
	e.printStackTrace();
	}
	}*/
}
?>