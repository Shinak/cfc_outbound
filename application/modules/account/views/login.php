<html>
<head>
<link rel="stylesheet" href="<?php echo base_url();?>resources/css/account_login.css">
<title>User Login</title>
</head>
<body>

<div class="container"> 
    <?php 
        if(isset($flash)){echo $flash;}
        echo validation_errors('<p style="color: red;">Error', '</p>'); 
        echo form_open('account/login', 'class="form-signin"'); 
    ?>
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUsername" class="sr-only">Username</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus value="<?php echo set_value('username'); ?>" />
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password" value="<?php echo set_value('password'); ?>" />
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" name ="sign_in" value="sign_in" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->

</body>
</html>


