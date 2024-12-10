<%--
  Created by IntelliJ IDEA.
  User: LAPTOP USA PRO
  Date: 09-12-2024
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
</head>
<style>
    .infor_product {
        display: flex;
    }

    .infor_product > div {
        width: 50%;
    }

    .title {
        font-family: 'Times New Roman', Times, serif;
        font-weight: bold;
        font-size: 20px;
    }

    .product {
        display: flex;
    }

    .product>div {
        margin: 5px;
    }

    .product_infor {
        display: flex;
        flex-direction: column;

    }

    .product_name {
        font-family: 'Times New Roman', Times, serif;
        font-size: 15px;
        font-weight: bold;

        margin: 5px;
    }

    .product_price {
        display: flex;
    }

    .product_price > div {
        font-family: 'Times New Roman', Times, serif;
        font-size: 15px;
        font-weight: bold;

        margin: 5px;
    }

    .old_price_product {
        text-decoration: line-through;
    }

    .price {
        font-family: 'Times New Roman', Times, serif;
        font-size: 15px;
        font-weight: bold;

        margin: 5px;
    }
</style>

<body>
<div class="infor_product">
    <div>
        <img src="https://product.hstatic.net/200000677367/product/dsc06540_copy_2mb_2df878aae2e9468a93bcae75bad66305_master.jpg"
             style="width: 100%;">
    </div>
    <div>
        <div class="title">BASIC LOGO SWEATPANTS</div>
        <div class="price">620000đ</div>
        <div>Màu sắc</div>
        <div>
            <input type="radio" name="color" value="white">
            <input type="radio" name="color" value="black">
        </div>
        <div>Kích thước</div>
        <div>
            <button>M</button>
            <button>L</button>
        </div>
        <div>
            <button>MUA NGAY</button>
            <button>THÊM VÀO GIỎ</button>
        </div>
        <div>Thông tin sản phẩm</div>
        <div>Kích thước</div>
        <div>Chính sách giao hàng</div>
        <div>Chính sách đổi trả</div>
    </div>
</div>

<div class="title">Gợi ý cho bạn</div>
<div class="product">
    <div>
        <a href="product.jsp">
            <img src="https://product.hstatic.net/200000677367/product/161_da22d96f39a94e88984ef4f014ccc164_master.jpg"
                 style="width: 100%;">
        </a>
        <div class="product_infor">
            <div class="product_name">REBOOT THE PROGRAM BIG BOXY T-SHIRT</div>
            <div class="product_price">
                <div>329,000₫</div>
                <div class="old_price_product">390,000₫</div>
            </div>
        </div>
    </div>
    <div>
        <a href="product.jsp">
            <img src="https://product.hstatic.net/200000677367/product/175_cca8e55234c7438d959f838601f48428_master.jpg"
                 style="width: 100%;">
        </a>
        <div class="product_infor">
            <div class="product_name">SS NO.2 BIG BOXY SHIRT</div>
            <div class="product_price">
                <div>439,000₫</div>
                <div class="old_price_product">450,000₫</div>
            </div>
        </div>
    </div>
    <div>
        <a href="product.jsp">
            <img src="https://product.hstatic.net/200000677367/product/173_b2b86a9beac3495ba2e60d2df56c27c3_master.jpg"
                 style="width: 100%;">
        </a>
        <div class="product_infor">
            <div class="product_name">SS LOGO CARGO PANTS V.2</div>
            <div class="product_price">
                <div>599,000₫</div>
                <div class="old_price_product">620,000₫</div>
            </div>
        </div>
    </div>
    <div>
        <a href="product.jsp">
            <img src="https://product.hstatic.net/200000677367/product/171_37870a0a7d364cf9a9d1cbcc82d66a41_master.jpg"
                 style="width: 100%;">
        </a>
        <div class="product_infor">
            <div class="product_name">THE STAR BOXY HOODIE</div>
            <div class="product_price">
                <div>579,000₫</div>
                <div class="old_price_product">650,000₫</div>
            </div>
        </div>
    </div>
    <div>
        <a href="product.jsp">
            <img src="https://product.hstatic.net/200000677367/product/172_ae5726e7f2db411d9f6ba4fd4249a96e_master.jpg"
                 style="width: 100%;">
        </a>
        <div class="product_infor">
            <div class="product_name">SS LOGO BAGGY PANTS</div>
            <div class="product_price">
                <div>599,000₫</div>
                <div class="old_price_product">620,000₫</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
