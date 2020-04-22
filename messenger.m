clear;
clc;
close all;

CREDENTIALS = 'credentials.csv';
isServerAuthed = true;
clientID = randi(100000);
global message

% check for credentials
if ~isfile(CREDENTIALS)
    url = input('MQTT Server URL: ', 's');
    username = input('MQTT Username: ', 's');
    pass = input('MQTT Password: ', 's');
    url = strcat('tcp://', url);
    writecell({url, username, pass}, CREDENTIALS, 'Delimiter','comma');
    if isempty(username)
        isServerAuthed = false;
    end
else
    cred_matrix = readcell(CREDENTIALS);
    url = cred_matrix{1};
    try
        username = cred_matrix{2};
        pass = cred_matrix{3};
    catch
        isServerAuthed = false;
    end
end

try
    if isServerAuthed
        connection = mqtt(url, 'Username', username, 'Password', pass, 'ClientID', int2str(clientID));
    else
        connection = mqtt(url);
    end
catch ME
    disp('Error occured while trying to connect to the server:');
    disp(ME.message);
    return
end
        

message = input('Message to send (q to exit): ', 's');

subscription = subscribe(connection, 'msg', 'Callback', @(topic, msg) dispMessage(topic, msg, message));



while (message ~= 'q')
    send(message, connection);
    message = input('Message to send (q to exit): ', 's');
end
