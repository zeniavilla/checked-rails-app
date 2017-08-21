Handlebars.registerHelper('pluralize', function(number, word) {
    if (number === 1) { 
        return number + ' ' + word.replace('s', ''); 
    } else {
        return number + ' ' + word;
    }
});