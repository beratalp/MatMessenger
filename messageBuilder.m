function returnJSON = messageBuilder(message, user)
    c = clock;
    returnS.message = message;
    returnS.user = user;
    
    hour = int2str(c(4));
    if length(hour) < 2
        hour = strcat('0', hour);
    end
    
    minute = int2str(c(5));
    if length(minute) < 2
        minute = strcat('0', minute);
    end
    
    returnS.time = strcat(hour, ':', minute);
    returnJSON = jsonencode(returnS);
end