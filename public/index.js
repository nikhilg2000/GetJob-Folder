var express=require("express");
var bodyParser=require('body-parser');
 
var conn = require('./config');
var app = express();
app.use(express.static("public"));

app.use(bodyParser.urlencoded({ extended: true }));

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.get('/', function (req, res) {
   res.redirect('/index.html') 
})

app.get('*', function(req, res){
	res.redirect('/index.html')
})
 
app.get('/index.html', function(req, res){
	res.sendFile("index.html");
})

app.get('/GetJob_Login.html', function (req, res) {  
   res.sendFile( "GetJob_Login.html" );  
})  

app.get('/GetJob Registration.html', function(req, res){
	res.sendFile("GetJob Registration.html");
})


app.post('/GetJob_Login', function(req, res){
	conn.query("INSERT INTO users VALUES (?, ?);", [req.body.email,  req.body.password], function(error, results, fields){
		if(error){
			console.log(error);
			res.json({
				success: false
			});
		} else {
			res.json({
				success: true
			})
		}
	});

});

app.post('/GetJob_Login', function(req, res){
	conn.query("SELECT * FROM users WHERE email=?", req.body.email, function(error, results, fields){
		var body = req.body;
		var success = null;
		var message = "";

		if(error){
			success = false;
			message = "Unknown error occured"
		} else {
			
			
			/*
			You will receive the output of the query in the variable results as an array.
			You also have the data from the form in the varible body. Make sure you console.log() to understand the format.
			TODO:
			1. Make sure the results array has length greater than 0.
			2. If the length is greater than 0, check for the username received in the request.
			3. If the username is correct, check for the password received in the request.
			4. If everything checks out, assign success as TRUE and message as "Success".
			5. If it fails the check at any point, assign success as FALSE and message as the reason it failed. 
				e.g: "Username does not match", "Email ID does not exist", etc.  
			*/
			
			if (results.length > 0){
					if(results[0].password == req.body.password){
						success = true;
						message = "You have logged in. Good job.";
						}
					else {
						success = false;
						message = "Password was not entered correctly! Please enter the correct password.";
						}
					}
				
			
			else {
				success = false;
				message = "Information was not entered! Please enter.";
			}
			}
			
		
		
	res.json({
				success: success,
				message: message
			});
	})

})


app.listen(3000);