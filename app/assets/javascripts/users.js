function User(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.email = attributes.email;
    this.chore = { 'lastCompleted': lastCompletedChore(attributes), 'numCompleted': numCompletedChores(attributes), 'nextDueChore': nextDueChore(attributes) }
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

function numCompletedChores(attributes) {
    var numChores = 0;
    attributes.chores.forEach(function(chore) {
            if (!chore.active) {
                numChores++;
            }
        })
        return numChores;
}

function lastCompletedChore(attributes) {
    var lastDate = '';
    attributes.chores.forEach(function(chore) {
        if (!chore.active && chore.updated_at > lastDate) {
            lastDate = chore.updated_at;
        }
    })
    return lastDate;
}

function nextDueChore(attributes) {
    var nextDate = 'Z';
    if (!attributes.chores.length) {
        return undefined
    }
    attributes.chores.forEach(function(chore) {
        if(chore.active && chore.duration_end_date < nextDate) {
            nextDate = chore.duration_end_date;
        }
    })
    
    return nextDate;
}

$(function() {
    setUserHandlebarsTemplate();
    setUserJsModel();
})

function setUserHandlebarsTemplate() {
    User.prototype.renderLi = function() {
        return HandlebarsTemplates['users/show'](this)
    }
}

function setUserJsModel() {
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