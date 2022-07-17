if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image');

    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成する→下記のコードにより、edit/create.html.erbのdivで設定した部分に出力させる。
      const imageElement = document.createElement('div');
      // 表示する画像を生成する
      const blobImage = document.createElement('img');
        blobImage.className="preview"; //←createElementで生成したimgにクラス名を設定
      blobImage.setAttribute('src', blob);
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('idea-image').addEventListener('change', function(e){
      // 画像が表示されている場合に限り、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}