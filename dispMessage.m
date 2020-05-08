function dispMessage(~, recv, msg)
    recv_struct = jsondecode(recv);
    sameness = strcmp(recv_struct.message, msg);
    if sameness == 0
        fprintf('\n');
        fprintf('New Message from ')
        fprintf(recv_struct.user)
        fprintf(': ')
        fprintf(recv_struct.message)
        fprintf(' received at ')
        fprintf(recv_struct.time)
        fprintf('\n')
        fprintf('Message to send (q to exit): ')
    end
end
