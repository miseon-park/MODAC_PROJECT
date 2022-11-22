<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <c:choose>
  <c:when test="${mno ne null}">
    <a href='javascript: like_func();'><img src='./images/좋아요전.png' id='like_img'></a>
  </c:when>
  <c:otherwise>
    <a href='javascript: login_need();'><img src='./images/좋아요후.png'></a>
  </c:otherwise>
</c:choose>

</body>
</html>