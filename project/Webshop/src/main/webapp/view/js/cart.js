document.addEventListener('DOMContentLoaded', function () {
    const cartItemsContainer = document.querySelector('.cart-items');
    const cartItems = document.querySelectorAll('.cart-item');
    const totalPriceElement = document.querySelector('.total-price');
    const orderNotes = document.querySelector('.order-notes');


    function updateTotalPrice() {
        let total = 0;
        cartItemsContainer.querySelectorAll('.cart-item').forEach(item => {
            const quantity = parseInt(item.querySelector('.quantity-input').value);
            const price = parseInt(item.getAttribute('data-price'));
            total += quantity * price;
        });
        totalPriceElement.textContent = total.toLocaleString('vi-VN') + 'đ';
    }

    function removeItem(item){
        item.remove();
        updateTotalPrice();
        if (cartItemsContainer.querySelectorAll('.cart-item').length === 0) {
            orderNotes.value = '';
        }
    }


    cartItems.forEach(item => {
        const removeButton = item.querySelector('.remove-button');
        removeButton.addEventListener('click', function() {
            removeItem(item)
        });

        const quantityInput = item.querySelector('.quantity-input');
        const quantityButtons = item.querySelectorAll('.quantity-button');
        quantityButtons.forEach(button => {
            button.addEventListener('click', function () {
                const action = this.getAttribute('data-action');
                let quantity = parseInt(quantityInput.value);

                if (action === 'increase') {
                    quantity++;
                } else if (action === 'decrease' && quantity > 1) {
                    quantity--;
                }
                quantityInput.value = quantity;
                updateTotalPrice();
            });
        });

        quantityInput.addEventListener('change', function(){
            let quantity = parseInt(quantityInput.value);
            if(isNaN(quantity) || quantity < 1 ){
                quantity = 1;
                quantityInput.value = 1;
            }
            updateTotalPrice()
        })
    });
    updateTotalPrice();
});