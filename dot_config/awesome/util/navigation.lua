local M = {}

function M.client_up()
	Awful.client.focus.global_bydirection("up")
	if client.focus then
		client.focus:raise()
	end
end

function M.client_down()
	Awful.client.focus.global_bydirection("down")
	if client.focus then
		client.focus:raise()
	end
end

function M.client_left()
	Awful.client.focus.global_bydirection("left")
	if client.focus then
		client.focus:raise()
	end
end

function M.client_right()
	Awful.client.focus.global_bydirection("right")
end

function M.swap_up()
	Awful.client.swap.global_bydirection("up")
end

function M.swap_down()
	Awful.client.swap.global_bydirection("down")
end

function M.swap_left()
	Awful.client.swap.global_bydirection("left")
end

function M.swap_right()
	Awful.client.swap.global_bydirection("right")
end
return M
