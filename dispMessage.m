function dispMessage(~, recv, message)
    if ~(strcmp(recv, message))
        fprintf('\n');
        disp('New Message: ' + recv)
        fprintf('Message to send (q to exit): ')
    end
end
