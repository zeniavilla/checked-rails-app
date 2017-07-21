function Chore(attributes) {
        this.title = attributes.title;
        this.id = attributes.id;
        this.frequencyAmount = attributes.frequency_amount;
        this.frequencyInterval = attributes.frequency_interval;
        this.durationEndDate = attributes.duration_end_date;
        this.user = { 'name': attributes.user.name };
        this.category = { 'id': attributes.category.id, 'title': attributes.category.title };
}

Chore.success = function(json) {
    var chore = new Chore(json)
    
    var choreTd = chore.renderTd()

    $('table').append(choreTd)
}
Chore.error = function(response) {
    console.log("Broken", response)
}

$(function() {
    Chore.templateSource = $('#chore-template').html();
    Chore.template = Handlebars.compile(Chore.templateSource);
    
    var context = {
        id: 4,
        title: 'Chore',
        category: {
            id: 5,
            title: 'Cool'
        },
        user: {
            name: 'Steve Jobs'
        }, 
        durationEndDate: '2017-07-28T00:00:00.000Z', 
        frequencyAmount: 2, 
        frequencyInterval: 'days'
    }
    Chore.template(context)

    Chore.prototype.renderTd = function() {
        return Chore.template(this);
    }
})
    

$(function() {

    $("form").on('submit', function(event) {
        event.preventDefault();
        var params = $(this).serialize();
        var action = this.action;
        
        $.ajax ({
            url: action,
            method: 'POST',
            data: params,
            dataType: 'json'
        })
        .success(Chore.success)
        .error(Chore.error);
    });
});