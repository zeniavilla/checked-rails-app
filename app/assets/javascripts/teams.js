$(function(){
    setUserJsModel();
});

    var setUserJsModel = () => {
        $(".js-user-link").on('click', function(e) {
            e.preventDefault()
            var path = this.href;

            $.ajax({
                url: path,
                dataType: 'json',
                method: 'GET'
            })
            .success(function(json) {
                if ($("ul.team-users:contains(" + json.email + ")").length === 0) {
                    var user = new User(json);

                    var userLi = user.renderLi();

                    $('.js-user-info-' + json.id).append(userLi);
                } else {
                    $('.js-user-info-' + json.id).text("")
                }
            })
            .error(function(response) {
                console.log("Broken", response)
            })
        })
    }