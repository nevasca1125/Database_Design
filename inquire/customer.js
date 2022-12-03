(function(){
    const guide = document.querySelector('#guide');

    const customer = document.querySelector('#customer');
    const account = document.querySelector('#account');
    const card = document.querySelector('#card');
    const trans = document.querySelector('#transaction');
    const resm = document.querySelector('#resmitt');
    const auto = document.querySelector('#auto');

    const info_name = document.querySelector('#item_name');
    const info_number = document.querySelector('#item_number');
    const info_address = document.querySelector('#item_address');
    const info_phone = document.querySelector('#item_phone');
    const info_credit = document.querySelector('#item_credit');

    customer.addEventListener('click', function(){
        guide.innerHTML = '[고객조회]'
        document.form_inquire.action = "customer_out.jsp"
    })

    account.addEventListener('click', function(){
        guide.innerHTML = '[계좌조회]'
        document.form_inquire.action = "account_out.jsp"
    })

    card.addEventListener('click', function(){
        guide.innerHTML = '[카드조회]'
        document.form_inquire.action = "card_out.jsp"
    })

    trans.addEventListener('click', function(){
        guide.innerHTML = '[거래내역조회]'
        document.form_inquire.action = "trans_out.jsp"
    })

    resm.addEventListener('click', function(){
        guide.innerHTML = '[송금내역조회]'
        document.form_inquire.action = "resmitt_out.jsp"
    })

    auto.addEventListener('click', function(){
        guide.innerHTML = '[자동이체 목록조회]'
        document.form_inquire.action = "auto_out.jsp"
    })

    info_name.addEventListener('click', function(){
        if(info_name.checked){
            var p = document.createElement('p')
            p.innerHTML = "이름 : "
            p.setAttribute('id', 'name')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'name')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#name')
            document.form_inquire.removeChild(item)
        }
    })

    
    info_number.addEventListener('click', function(){
        if(info_number.checked){
            var p = document.createElement('p')
            p.innerHTML = "주민번호 : "
            p.setAttribute('id', 'number_r')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'number_r')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#number_r')
            document.form_inquire.removeChild(item)
        }
    })

    info_address.addEventListener('click', function(){
        if(info_address.checked){
            var p = document.createElement('p')
            p.innerHTML = "주소 : "
            p.setAttribute('id', 'address')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'address')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#address')
            document.form_inquire.removeChild(item)
        }
    })

    info_phone.addEventListener('click', function(){
        if(info_phone.checked){
            var p = document.createElement('p')
            p.innerHTML = "전화번호 : "
            p.setAttribute('id', 'phone')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'phone')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#phone')
            document.form_inquire.removeChild(item)
        }
    })

    info_credit.addEventListener('click', function(){
        if(info_credit.checked){
            var p = document.createElement('p')
            p.innerHTML = "신용점수 : "
            p.setAttribute('id', 'credit')
            document.form_inquire.appendChild(p)
            var input = document.createElement('input')
            input.setAttribute('type', 'text')
            input.setAttribute('name', 'credit')
            p.appendChild(input)
        }else{
            var item = document.querySelector('#credit')
            document.form_inquire.removeChild(item)
        }
    })
})();