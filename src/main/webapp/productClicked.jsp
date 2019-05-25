<%-- 
    Document   : productClicked.jsp
    Created on : May 25, 2019, 2:16:26 PM
    Author     : chenwang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
       <title> Venus Cosmetics </title>
        <meta charset = "utf-8" />
        <link rel = "stylesheet" type = "text/css" href = "style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
    
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
        <button class="tab_link"  onclick="window.location.href = 'EyePalette.jsp';">Product</button>
        <button class="tab_link"  onclick="window.location.href = 'about.html';">About Us</button>
        
        
        <div id = "productClicked" style="margin: auto;width: 60%; padding: 10px;">
            <div class="clickedDescription" style = "text-align: center;">
                <div class="clickedImage">
                    <img  id="ImgProduct" src="eyepallette\eye1.jpg" style="width: 150px; height:150px;" >
                </div>

                <h3 id="NameProduct">Name</h3>

                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span>27 Reviews</span>
                <p id = "PriceProduct">0.00 </p>
                <input id="AmountProduct" type="number" value= 1 style="font-size: 30px">

                <p>Description: Contains pressed powder eye shadow palette
                    (net weight / pods net 9 X 1.40 grams / 9 X 0.05 oz)</p>

                <button class="cartbutton" onclick="addItem(
                    document.getElementById('ImgProduct').src, document.getElementById('NameProduct').innerText,
                    parseInt(document.getElementById('PriceProduct').innerText), parseInt(document.getElementById('AmountProduct').value))">
                    ADD TO CART
                </button>
            </div>
        </div>
        <script>
           function getUrlVars() {
               var vars = {};
               var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
               vars[key] = value;});

               return vars;
           }
        
           var itemn = getUrlVars()["itemn"];
           document.getElementById('NameProduct').innerHTML = itemn;
           
           <%
               session.setAttribute("itemn", "name");
//               if (session.getAttribute("history") == null){
//                   ArrayList<ArrayList<String>> itemArray = new ArrayList<>();
//               }
//               else{
//                   ArrayList<ArrayList<String>> itemArray = (ArrayList<ArrayList<String>>)session.getAttribute("history");
//             
//               }
////               ArrayList<ArrayList<String>> itemArray = new ArrayList<>();
//               ArrayList<String> item = new ArrayList<>();
//               item.add("itemi");
//               item.add("itemn");
//               item.add("itemp");
//               itemArray.add(new ArrayList<String>());
//               //session.setAttribute("history",itemArray);
           %>
       

//
//
//           document.getElementById('ImgProduct').src = img;
//           document.getElementById('NameProduct').innerHTML = number;
//           document.getElementById('PriceProduct').innerHTML = price.toFixed(2);

       </script>
    </body>
</html>

