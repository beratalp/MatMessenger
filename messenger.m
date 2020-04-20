clear;
clc;

global message

url = 'tcp://incepted.xyz';
connection = mqtt(url);

message = input('Message to send (q to exit): ', 's');

subscription = subscribe(connection, 'msg', 'Callback', @(topic, msg) dispMessage(topic, msg, message));



while (message ~= 'q')
    send(message, connection);
    message = input('Message to send (q to exit): ', 's');
end

clear;
clc;