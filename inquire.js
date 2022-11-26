(function(){
    const detail = document.querySelector('#detail');
    const guide = document.querySelector('#guide');
    const form = document.querySelector('#form');

    const home = document.querySelector('#home');
    const customer_info = document.querySelector('#customer_info');
    const goods = document.querySelector('#goods_info');
    const name = document.querySelector('#nam');

    const customer = document.querySelector('#customer');
    const account = document.querySelector('#account');
    const card = document.querySelector('#card');
    const trans = document.querySelector('#transaction');
    const resm = document.querySelector('#resmitt');

    customer.addEventListener('click', function(){
        guide.innerHTML = '[고객조회] 해당하는 고객의 정보를 조회합니다.'
    })

    account.addEventListener('click', function(){
        guide.innerHTML = '[계좌조회]'
    })

    card.addEventListener('click', function(){
        guide.innerHTML = '[카드조회]'
    })

    trans.addEventListener('click', function(){
        guide.innerHTML = '[거래내역조회]'
    })

    resm.addEventListener('click', function(){
        guide.innerHTML = '[송금내역조회]'
    })

    home.addEventListener('click', function(){
        detail.innerHTML = '_HOME'
        guide.innerHTML = '&nbsp;'
    })

    customer_info.addEventListener('click', function(){
        detail.innerHTML = '_고객정보조회'
        guide.innerHTML = '[고객정보 조회] 이름과 주민번호를 입력하세요.'
        name.setAttribute('name', 'name');
    })

    goods.addEventListener('click', function(){
        detail.innerHTML = '_상품정보조회'
        guide.innerHTML = '[상품정보 조회] 상품명을 입력하세요.'
    })
})();