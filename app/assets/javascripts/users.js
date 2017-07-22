function User(attributes) {
    this.id = attributes.id;
    this.name = attributes.name;
    this.email = attributes.email;
    this.chore = { 'lastCompleted': lastCompletedChore(attributes), 'numCompleted': numCompletedChores(attributes) }
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
    
    var context = {
        id: 1,
        name: "Bruce Wayne",
        email: "bruce@batman.com",
        chore: {
            lastCompleted: "2017-07-20T22:53:33.597Z",
            numCompleted: 10
        }
    }

    User.prototype.renderLi = function() {
        return HandlebarsTemplates['users/show'](this)
    }
})