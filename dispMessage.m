function dispMessage(~, recv, message)
    sameness = strcmp(recv, message);
    if sameness == 0
        fprintf('\n');
        disp('New Message: ' + recv)
        fprintf('Message to send (q to exit): ')
    end
end
