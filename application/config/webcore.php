<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$config['asset_path'] = 'resources';
$config['image_path'] = $config['asset_path'].'/images';
$config['template_path'] = $config['asset_path'].'/views';
$config['cache_path'] = APPPATH.'cache/twig';
$config['css_path'] = base_url().$config['asset_path'].'/css';
$config['js_path'] = base_url().$config['asset_path'].'/js';
// end of file
