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
    setUserHandlebarsTemplate();
})

var setUserHandlebarsTemplate = () => {
    User.prototype.renderLi = function() {
        return HandlebarsTemplates['users/show'](this)
    }
}