let username = '';
let password = '';

const base_url = window.location.origin;
const location_path = window.location.pathname;

let output = {
    icon : 'icon',
    title: 'title',
    text : 'text'
};

let redirection = '';

function get(user, pass)
{
    username  = user;
    password = pass;
}

function login()
{
    $.post(`${base_url}/main/get`, {'username': username, 'password': password}, function(succ)
    {
        if(succ.status)
        {
            output.icon = 'success';
            output.title = 'WELCOME!';
            output.text = 'You succesfully Login!';
            redirection = `main/ask_credentials`;

            $.post(`${base_url}/main/ask_credentials`, 
            {
                'id': succ.id,
                'username': succ.username,
                'lastname': succ.lastname,
                'firstname': succ.firstname}, function(succ)
            {
                if(succ.status)
                {
                    redirection = 'profile';
                }
                else
                {
                    redirection = '';
                }
            },'json');
        }
        else
        {
            output.icon = 'error';
            output.title = 'LOGIN FAILED!';
            output.text = 'Please input correct credentials';
            redirection = '';
        }

        Swal.fire({
            icon:   `${output.icon}`,
            title:  `${output.title}`,
            text:   `${output.text}`,
        }).then(()=>{
            window.location.href = `${base_url}/${redirection}`;
        });

    }, 'json');
}

$('#adminLogin').submit(function(e)
{
    e.preventDefault();
    get($('#username').val(), $('#password').val());
    login();
});