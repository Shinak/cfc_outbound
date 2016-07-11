<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 *	Class Twig Environment
 */
class MY_Twig_template extends Twig_Autoloader
{
	private $CI;
	private $_twig;
	private $_template_dir;
	private $_cache_dir;
	public function __construct($debug = false)
	{
		$this->CI =& get_instance();
		self::requireTwigAutoloader();
		Twig_Autoloader::register();
		$this->CI->config->load('webcore');
		$this->_template_dir = $this->CI->config->item('template_dir');
		$this->_cache_dir = $this->CI->config->item('cache_dir');
		$loader = new Twig_Loader_Filesystem($this->_template_dir);
		$this->_twig = new Twig_Environment($loader, array(
			'cache' => $this->_cache_dir,
			'debug' => true,
		));
		$this->_twig->addExtension(new Twig_Extension_Debug());
		// enable all php function on twig
		foreach(get_defined_functions() as $functions) {
			foreach($functions as $func) {
				$this->_twig->addFunction($func, new Twig_Function_Function($func));
			}
		}
		// add session on twig template
		$this->_twig->addGlobal("session", $this->CI->session);
	}
	public function add_function($name)
	{
		$this->_twig->addFunction($name, new Twig_Function_Function($name));
	}
}