$(function(){
        $(".js-user-link").on('click', function(e) {
            e.preventDefault()
            var path = this.href;

            $.ajax({
                url: path,
                dataType: 'json',
                method: 'GET'
            })
            .success(function(json) {
                var user = new User(json);

                var userLi = user.renderLi();

                $('.js-user-info-' + user.id).append(userLi);
            })
            .error(function(response) {
                console.log("Broken", response)
            })
        })
    });