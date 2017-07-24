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
    $('#new_chore')[0].reset()
    $('.js-add-chore i').removeClass('green-background')
}
Chore.error = function(response) {
    console.log("Broken", response)
}

$(function() {
    Chore.templateSource = $('#chore-template').html();
    // Chore.template = Handlebars.compile(Chore.templateSource);
    
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
    // Chore.template(context)
    

    // Chore.template = HandlebarsTemplates['chores/index']({chore: context});
    Chore.prototype.renderTd = function() {
        return HandlebarsTemplates['chores/index'](this);
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

$(function() {
    $('#chore_title').on('input',function(e){
        if ($('#chore_title').val().length) {
            $(".js-add-chore i").addClass('green-background');
        } else {
            $('.js-add-chore i').removeClass('green-background');
        }
    });
});