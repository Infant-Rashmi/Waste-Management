<html>

  <head>
    <title>
      Mode of Payment
    </title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
    <link rel="stylesheet" href="styles.css">

  <body>


    <div class="wrapper">
      <div class="payment">
        <div class="payment-logo">
          <p>p</p>
        </div>




        <h2>
          Mode of Payment
          <hr>
        </h2>
        <div class="form">

          <div class="card space icon-relative">
          <%String total=request.getParameter("total");%>

            <a href="summary.jsp">RECEIVE COUPON</a>
            <i class="fas fa-tags"></i>
          </div>
          <div class="card space icon-relative">
            <a href="summarycash.jsp">RECEIVE CASH ON DELIVERY</a>
            <i class="fas fa-money-check-alt"></i>
          </div>

        </div>
      </div>
    </div>
  </body>
  </head>

</html>