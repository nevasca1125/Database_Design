(function(){
    const guide = document.querySelector('#guide');

    const goods_card = document.querySelector('#goods_card');
    const goods_account = document.querySelector('#goods_account');

    const info_goods = document.querySelector('#item_goods');
    const info_type = document.querySelector('#item_type');
    const info_target = document.querySelector('#item_target');
    const info_interest = document.querySelector('#item_interest');

    goods_card.addEventListener('click', function(){
        guide.innerHTML = '[카드상품조회]'
        document.form_inquire.action = "goods_card_out.jsp"
    })

    goods_account.addEventListener('click', function(){
        guide.innerHTML = '[계좌상품조회]'
        document.form_inquire.action = "goods_account_out.jsp"
    })

    info_goods.addEventListener('click', function(){
        if(info_goods.checked){
            var p = document.createElement('p')
            p.innerHTML = "상품명 : "
            p.setAttribute('id', 'title_g')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'title')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#title_g')
            document.form_inquire.removeChild(item)
        }
    })

    info_type.addEventListener('click', function(){
        if(info_type.checked){
            var p = document.createElement('p')
            p.innerHTML = "상품타입 : "
            p.setAttribute('id', 'type')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'type')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#type')
            document.form_inquire.removeChild(item)
        }
    })

    info_target.addEventListener('click', function(){
        if(info_target.checked){
            var p = document.createElement('p')
            p.innerHTML = "가입대상 : "
            p.setAttribute('id', 'target')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'target')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#target')
            document.form_inquire.removeChild(item)
        }
    })

    info_interest.addEventListener('click', function(){
        if(info_interest.checked){
            var p = document.createElement('p')
            p.innerHTML = "금리 : "
            p.setAttribute('id', 'interest')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'interest')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#interest')
            document.form_inquire.removeChild(item)
        }
    })
})();