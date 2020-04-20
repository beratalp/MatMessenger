function send(msg, cn)
    publish(cn, 'msg', msg);
end

