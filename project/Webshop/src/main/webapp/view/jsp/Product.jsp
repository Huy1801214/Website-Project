<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/product.css">
    <title>Product</title>
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div class="infor_product">
    <div>
        <img src="https://product.hstatic.net/200000677367/product/dsc06540_copy_2mb_2df878aae2e9468a93bcae75bad66305_master.jpg"
             alt="Product Image" style="width: 100%;">
    </div>
    <div>
        <div class="title">BASIC LOGO SWEATPANTS</div>
        <div class="price">620,000₫</div>
        <div>Màu sắc</div>
        <div class="color-selector">
            <input type="radio" name="color" value="white">
            <input type="radio" name="color" value="black">
        </div>
        <div>Kích thước</div>
        <div class="size-buttons">
            <button>M</button>
            <button>L</button>
        </div>
        <div>
            <button class="buy-button">MUA NGAY</button>
            <button class="add-button">THÊM VÀO GIỎ</button>
        </div>
        <div class="accordion">
            <div class="accordion-header">Thông tin sản phẩm</div>
            <div class="accordion-content">
                <div>Màu sắc: Đen/Xám</div>
                <div>Form: Ống rộng</div>
                <div>Size: M/L</div>
                <div>Chất liệu: Cotton (nỉ bông), 350gsm</div>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Kích thước</div>
            <div class="accordion-content">
                <p>Thông tin về kích thước sản phẩm sẽ được hiển thị tại đây.</p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Chính sách giao hàng</div>
            <div class="accordion-content">
                <p>Thông tin về chính sách giao hàng của chúng tôi sẽ được hiển thị tại đây.</p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Chính sách đổi trả</div>
            <div class="accordion-content">
                <p>Thông tin về chính sách đổi trả của chúng tôi sẽ được hiển thị tại đây.</p>
            </div>
        </div>
    </div>
</div>
<div class="title" style="margin-left: 20px; text-align: center;">Gợi ý cho bạn</div>
<div class="product-container">
    <div class="product">
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/161_da22d96f39a94e88984ef4f014ccc164_master.jpg"
                     alt="Product 1">
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
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/175_cca8e55234c7438d959f838601f48428_master.jpg"
                     alt="Product 2">
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
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/173_b2b86a9beac3495ba2e60d2df56c27c3_master.jpg"
                     alt="Product 3">
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
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/171_37870a0a7d364cf9a9d1cbcc82d66a41_master.jpg"
                     alt="Product 4">
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
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/172_ae5726e7f2db411d9f6ba4fd4249a96e_master.jpg"
                     alt="Product 5">
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
</div>
<script>
    const accordionHeaders = document.querySelectorAll('.accordion-header');

    accordionHeaders.forEach(header => {
        header.addEventListener('click', () => {
            const content = header.nextElementSibling;
            const isActive = header.classList.contains('active');
            // Close all other open items
            accordionHeaders.forEach(otherHeader => {
                if (otherHeader !== header && otherHeader.classList.contains('active')) {
                    otherHeader.classList.remove('active');
                    otherHeader.nextElementSibling.classList.remove('show')
                }
            });
            header.classList.toggle('active');
            content.classList.toggle('show');
        });
    });
    // Drag to scroll
    const productContainer = document.querySelector('.product-container');
    const product = document.querySelector('.product');
    let isDragging = false;
    let startX;
    let scrollLeft;
    product.addEventListener('mousedown', (e) => {
        isDragging = true;
        product.classList.add('dragging');
        startX = e.pageX - product.offsetLeft;
        scrollLeft = product.scrollLeft;
    });

    product.addEventListener('mouseleave', () => {
        isDragging = false;
        product.classList.remove('dragging');
    });

    product.addEventListener('mouseup', () => {
        isDragging = false;
        product.classList.remove('dragging');
    });

    productContainer.addEventListener('mousemove', (e) => {
        if (!isDragging) return;
        e.preventDefault();
        const x = e.pageX - product.offsetLeft;
        const walk = (x - startX);
        product.style.transform = `translateX(${walk}px)`;
    });
</script>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
</body>
</html>