<%-- 
    Document   : EyePalette
    Created on : May 24, 2019, 5:35:38 PM
    Author     : chenwang
--%>
<%@ page import=" java.io.IOException"%>
<%@ page import=" java.io.PrintWriter"%>
<%@ page import=" java.sql.Connection"%>
<%@ page import=" java.sql.Driver"%>
<%@ page import=" java.sql.DriverManager"%>
<%@ page import=" java.sql.PreparedStatement"%>
<%@ page import=" java.sql.ResultSet"%>
<%@ page import=" java.sql.SQLException"%>
<%@ page import=" java.sql.Statement"%>
<%@ page import=" javax.servlet.RequestDispatcher"%>
<%@ page import=" javax.servlet.ServletConfig"%>
<%@ page import=" javax.servlet.ServletException"%>
<%@ page import=" javax.servlet.annotation.WebServlet"%>
<%@ page import=" javax.servlet.http.HttpServlet"%>
<%@ page import=" javax.servlet.http.HttpServletRequest"%>
<%@ page import=" javax.servlet.http.HttpServletResponse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Venus Cosmetics </title>
        <meta charset = "utf-8" />
        <link rel = "stylesheet" type = "text/css" href = "style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
        
        <script>
            var shoppingCart = [];
            var totalPrice = 0;
            var Item = function(images, name, price, count){
                this.Images = images;
                this.Name = name;
                this.Price = price;
                this.Count = count;
            };

            function addItem(images, name, price, amount){
                for(var product in shoppingCart){
                    if(shoppingCart[product].Name === name ){
                        shoppingCart[product].Count.value++;
                        updateShoppingBag();
                        return;
                    }
                }
                var img = document.createElement("img");
                var input = document.createElement('input');
                img.src = images;
                input.type = "number"; input.min = '0';input.value = amount;
                input.style.cssText = 'width:30%;padding:30px;height:5em;font-size:25px;font-weight:bold;';
                input.addEventListener('click', updateShoppingBag);
                var items = new Item(img, name, price, input);
                shoppingCart.push(items);
                updateShoppingBag();

            }
            function loadProduct(img, name, price){
                document.getElementById('ImgProduct').src = img;
                document.getElementById('NameProduct').innerHTML = name;
                document.getElementById('PriceProduct').innerHTML = price.toFixed(2);
            }
        </script>
    </head>
    <body>
        <div id="top_nav" >
            <a href="shoppingCart.html" onclick="verify_CheckOut()">My Cart</a>
        </div>
        <script>
            window.onscroll = function() {myFunction();};

            var top_nav = document.getElementById("top_nav");
            var sticky = top_nav.offsetTop;

            function myFunction() {
                if (window.pageYOffset >= sticky) {
                    top_nav.classList.add("sticky");
                } else {
                    top_nav.classList.remove("sticky");
                }
            }
        </script>


        <button id="defaultOpen" class="logo_link"  onclick="window.location.href = 'homebutton.html';">Venus Cosmetics</button>
        <button class="tab_link"  onclick="window.location.href = 'EyePalette.html';">Product</button>
        <button class="tab_link"  onclick="window.location.href = 'about.html';">About Us</button>
        <div id = "Eye">
            <%
            try {
                String connectionURL = "jdbc:mysql://127.0.0.1:8889/test";
                Connection conn = null; 
                Statement stmt = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                conn = DriverManager.getConnection(connectionURL, "root", "root");
                if(!conn.isClosed())
                    //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                    out.println("<br>");
                    stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                    while(rs.next()){  
                        String name = rs.getString("itemn");
                        out.println("   <div class=\"columns\">");
                        out.println("       <ul  class=\"products\">");
                        out.println("           <li>");
                        out.println("               <a href=\"productClicked.html?itemn="+name+"\">");
                        out.println("                   <img class = \"resize\" src=" + rs.getString("itemi") +">");
                        out.println("               </a>");
                        out.println("           </li>");
                        out.println("           <li>THE VALElkdjf</li>");
                        out.println("           <li class= \"price\">$50.00</li>");
                        out.println("           <li><button class=\"cartbutton\" >ADD TO CART</button></li>");
                        out.println("       </ul>");
                        out.println("   </div>");
                    }
              
                conn.close();
            }catch(Exception ex){
                out.println("Unable to connect to database"+ex);
            } 
        %>    
<!--            <div class="columns">
                <ul  class="products">
                    <li>
                        <a href="productClicked.html">
                        <img class = "resize" src="eyepallette\eye1.jpg" 
                            onclick="loadProduct('eyepallette\\eye1.jpg','THE VALENTINE PALETTE', 50.00, 1);">
                        </a>
                    </li>
                    <li>THE VALENTINE PALETTE</li>
                    <li class= "price">$50.00</li>
                    <li><button class="cartbutton" onclick="addItem('eyepallette\\eye1.jpg','THE VALENTINE PALETTE', 50.00, 1)">
                        ADD TO CART</button></li>

                </ul>

            </div>-->
        </div>

    </body>
</html>
