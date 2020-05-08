function dispMessage(~, recv, msg)
    recv_message = jsondecode(recv).message;
    sameness = strcmp(recv_message, msg);
    if sameness == 0
        fprintf('\n');
        fprintf('New Message: ')
        disp(recv_message)
        fprintf('Message to send (q to exit): ')
    end
end
