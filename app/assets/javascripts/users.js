function User(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.email = attributes.email;
    this.chore = { 'lastCompleted': lastCompletedChore(attributes), 'numCompleted': numCompletedChores(attributes) }
}

User.success = function(json) {
    if ($("ul.team-users:contains(" + json.email + ")").length === 0) {
        var user = new User(json);

        var userLi = user.renderLi();

        $('.js-user-info-' + json.id).append(userLi);
    } else {
        $('.js-user-info-' + json.id).text("")
    }
}

User.error = function(response)  {
    console.log("Broken", response)
}

var numCompletedChores = attributes => {
    var numChores = 0;
    attributes.chores.forEach(function(chore) {
            if (!chore.active) {
                numChores++;
            }
        })
        return numChores;
}

var lastCompletedChore = attributes => {
    var lastDate = '';
    attributes.chores.forEach(function(chore) {
        if (!chore.active && chore.updated_at > lastDate) {
            lastDate = chore.updated_at;
        }
    })
    return lastDate;
}

$(function() {
    setUserHandlebarsTemplate();
    setUserJsModel();
})

var setUserHandlebarsTemplate = () => {
    User.prototype.renderLi = function() {
        return HandlebarsTemplates['users/show'](this)
    }
}

var setUserJsModel = () => {
    $(".js-user-link").on('click', function(e) {
        e.preventDefault()
        var path = this.href;

        $.ajax({
            url: path,
            dataType: 'json',
            method: 'GET'
        })
        .success(User.success)
        .error(User.error)
    })
}