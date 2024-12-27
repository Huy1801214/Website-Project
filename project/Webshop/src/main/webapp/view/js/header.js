document.addEventListener('DOMContentLoaded', function () {
    const cartCountElement = document.getElementById('cart-count');

    function updateCartCount() {
        let cartItems = document.querySelectorAll('.cart-item');
        let totalQuantity = 0;
        cartItems.forEach(item => {
            let quantityInput = item.querySelector('.quantity-input');
            totalQuantity += parseInt(quantityInput.value);
        });
        cartCountElement.textContent = totalQuantity;
    }

    updateCartCount();

    //check for change quantity on the page
    const cartItemsContainer = document.querySelector('.cart-items');
    if (cartItemsContainer) {
        cartItemsContainer.addEventListener('change', updateCartCount)
        cartItemsContainer.addEventListener('click', updateCartCount);
    }

});