function makeElement(){
    const form = document.querySelector('#form_inquire');

    const name = document.getElementById('item_name');

    if(name.checked){
        let n = document.createElement('p');
        n.setAttribute('id', 'name');
        form.appendChild(n);
        let na = document.querySelector('#name');
        let info_name = document.createElement('input');
        info_name.setAttribute('type', 'text');
        info_name.setAttribute('name', 'name');
    }else{
        let na = document.querySelector('#name');
        form.removeChild(na);
    }
}


(function(){
    const detail = document.querySelector('#detail');
    const guide = document.querySelector('#guide');
    const guide2 = document.querySelector('#guide2');

    const home = document.querySelector('#home');
    const customer_info = document.querySelector('#customer_info');
    const goods = document.querySelector('#goods_info');

    const customer = document.querySelector('#customer');
    const account = document.querySelector('#account');
    const card = document.querySelector('#card');
    const trans = document.querySelector('#transaction');
    const resm = document.querySelector('#resmitt');

    const info_name = document.querySelector('#item_name');
    const info_number = document.querySelector('#item_number');

    customer.addEventListener('click', function(){
        guide.innerHTML = '[고객조회]'
        guide2.innerHTML = '조회할 고객의 정보를 입력해주세요.'
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

    home.addEventListener('click', function(){
        detail.innerHTML = '_HOME'
        guide.innerHTML = '&nbsp;'
    })

    customer_info.addEventListener('click', function(){
        detail.innerHTML = '_고객정보조회'
        guide.innerHTML = '[고객조회]'
        guide2.innerHTML = '조회할 고객의 정보를 입력해주세요.'
    })

    goods.addEventListener('click', function(){
        detail.innerHTML = '_상품정보조회'
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
})();