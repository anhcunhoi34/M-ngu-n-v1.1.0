<?php
/**
 * all ajax call will be handle from here
 * */
class Updator{

    private $db;

    public function __construct() {
        if (method_exists($this,$_POST['action_type'])){
            $this->{$_POST['action_type']}($_POST);
        }
    }


    public function replace_app_file(){
        $update_file_path = 'app';
        $old_file_path = '../app';
        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "App Files Updated Successfully"
        ]);

    }

    public function replace_public_asset_file(){
        $update_file_path = 'public';
        $old_file_path = '../public';
        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Public Files Updated Successfully"
        ]);
    }


    public function replace_config_file(){
        $update_file_path = 'config';
        $old_file_path = '../config';
        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Config Files Updated Successfully"
        ]);
    }

    public function replace_database_file(){
        $update_file_path = 'database';
        $old_file_path = '../database';
        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Database Files Updated Successfully"
        ]);
    }

    public function replace_module_file(){
        $update_file_path = 'Modules';
        $old_file_path = '../Modules';

        // $update_file_path = __DIR__.'/Modules';
        // $old_file_path = __DIR__.'/../@core/Modules';

        if (!is_dir('../Modules') && !file_exists(  '../Modules')) {
            if (!mkdir($concurrentDirectory =  '../Modules' , 0755, true) && !is_dir($concurrentDirectory)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
            }
        }

        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Modules Files Updated Successfully"
        ]);

    }

    public function replace_resources_file(){
        $update_file_path = 'resources';
        $old_file_path = '../resources';

        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Resource Files Updated Successfully"
        ]);

    }

    public function replace_routes_file(){
        $update_file_path = 'routes';
        $old_file_path = '../routes';

        $this->ReplaceFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Route Files Updated Successfully"
        ]);

    }

    public function replace_vendor_file(){
        $update_file_path = 'vendor';
        $old_file_path = '../vendor';

        $this->ReplaceVendorFileFolder($update_file_path,$old_file_path);

        $this->message([
            'type' => 'success',
            'msg' => "Vendor Files Updated Successfully"
        ]);

    }

    public function replace_custom_file(){
        $change_log_file = file_get_contents('custom_file.json');
        $change_log_list = json_decode($change_log_file);
        $custom_files = $change_log_list->custom;

        foreach ($custom_files as $file){
            if (is_dir('../' . $file->path) && file_exists(  '../' . $file->path)) {
                $update_file_content = file_get_contents( 'custom/' . $file->filename);
                // file_put_contents( '../' . $file->path . '/' . $file->filename, $update_file_content);
                file_put_contents( '../' . $file->filename, $update_file_content);
            } else {
                if (!mkdir($concurrentDirectory =  '../' . $file->path, 0755, true) && !is_dir($concurrentDirectory)) {
                    throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
                }
                $update_file_content = file_get_contents(  'custom/' . $file->filename);
                file_put_contents( '../' . $file->filename, $update_file_content);
            }
        }

        $this->message([
            'type' => 'success',
            'msg' => "Custom Files Updated Successfully"
        ]);

    }


    public function ReplaceFileFolder($update_file_path,$old_file_path){

        $all_update_views = $this->get_file_list_by_directory($update_file_path);
        $all_old_views = $this->get_file_list_by_directory($old_file_path);

        foreach ($all_update_views as $new_file){


            $not_allow_to_update_files_list = [
              "dynamic-style.css",
              "dynamic-style.js",
              ".git",
                ".idea",
                ".DS_Store",
            ]; //only file/folder

            if (in_array($new_file,$not_allow_to_update_files_list)){
                continue;
            }



            if (is_dir($update_file_path.'/'.$new_file)){
                $old_file = array_search($new_file,$all_old_views);

                $folder_name = isset($all_old_views[$old_file]) ? $all_old_views[$old_file] : '';

                if (!file_exists($old_file_path.'/'.$new_file)){
                    if (!mkdir($concurrentDirectory = $old_file_path . '/' . $new_file) && !is_dir($concurrentDirectory)) {
                        throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
                    }
                    $folder_name = $new_file;
                }
                $this->ReplaceFileFolder($update_file_path.'/'.$new_file,$old_file_path.'/'.$folder_name);
            }else{
                $file_index = array_search($new_file, $all_old_views);
                $update_file_path_new = $update_file_path ;
                $script_old_file_path = $old_file_path ;

                $folder_name = $all_old_views[$file_index] ?? $new_file;
                $update_able_file_size = $this->get_file_size($update_file_path_new .'/'.$new_file);
                $script_able_file_size = $this->get_file_size($script_old_file_path.'/'.$folder_name);


                $this->update_file($update_file_path.'/'.$new_file, $script_old_file_path.'/'.$folder_name);
                if(!is_dir($script_old_file_path) && !file_exists($script_old_file_path.'/'.$new_file)){
                    file_put_contents($script_old_file_path.'/'.$new_file,file_get_contents($update_file_path_new.'/'.$new_file));
                }
            }
        }
    }

    public function get_file_list_by_directory($dir){
        $get_file = array_diff(scandir($dir), array('.', '..', '.DS_Store',".git"));
        return $get_file;
    }


    public function get_file_size($file_path){
        return  file_exists($file_path) ? filesize($file_path) : 0;
    }


    public function update_file($update_file, $old_file)
    {
        $update_data = file_get_contents($update_file);
        file_put_contents($old_file, $update_data);
    }


    public function ReplaceVendorFileFolder($update_file_path,$old_file_path){

        $all_update_views = $this->get_file_list_by_directory($update_file_path);
        $all_old_views = $this->get_file_list_by_directory($old_file_path);
        foreach ($all_update_views as $new_file){
            if (is_dir($update_file_path.'/'.$new_file)){
                $old_file = array_search($new_file,$all_old_views);
                $folder_name = isset($all_old_views[$old_file]) ? $all_old_views[$old_file] : '';
                if (!file_exists($old_file_path.'/'.$new_file)){
                    if (!mkdir($concurrentDirectory = $old_file_path . '/' . $new_file) && !is_dir($concurrentDirectory)) {
                        throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
                    }
                    $folder_name = $new_file;
                }
                $this->ReplaceFileFolder($update_file_path.'/'.$new_file,$old_file_path.'/'.$folder_name);
            }else{
                $file_index = array_search($new_file, $all_old_views);
                $update_file_path_new = $update_file_path ;
                $script_old_file_path = $old_file_path ;

                $folder_name = $all_old_views[$file_index] ?? $new_file;
                $update_able_file_size = $this->get_file_size($update_file_path_new .'/'.$new_file);
                $script_able_file_size = $this->get_file_size($script_old_file_path.'/'.$folder_name);


                $this->update_file($update_file_path.'/'.$new_file, $script_old_file_path.'/'.$folder_name);

                if(!is_dir($script_old_file_path) && !file_exists($script_old_file_path.'/'.$new_file)){
                    file_put_contents($script_old_file_path.'/'.$new_file,file_get_contents($update_file_path_new.'/'.$new_file));
                }
            }
        }
    }


    public function language_generate(){

        $dynamic_lang_dir = glob('../lang' . '/*', GLOB_ONLYDIR);

        // admin blade file lang
        $admin_custom_language = [];
        $new_languages = include('lang/en/admin.php');

        foreach ($dynamic_lang_dir as $lang_dir) {

            $lang_file = $lang_dir . '/admin.php';

            if (file_exists($lang_file)) {

                $existing_languages = include $lang_file;

                foreach($existing_languages as $exist_key => $exist_language){
                    $admin_custom_language[$exist_key] = $exist_language;
                }

                foreach($new_languages as $new_key => $new_language){
                    $admin_custom_language[$new_key] = $new_language;
                }

                file_put_contents($lang_file, "<?php\n return " . var_export($admin_custom_language, true) . ";\n");
            }
        }

        // admin blade file lang

        // admin validation file lang
        $user_valid_custom_language = [];
        $admin_valid_new_languages = include('lang/en/admin_validation.php');

        foreach ($dynamic_lang_dir as $lang_dir) {

            $lang_file = $lang_dir . '/admin_validation.php';

            if (file_exists($lang_file)) {

                $admin_valid_existing_languages = include $lang_file;

                foreach($admin_valid_existing_languages as $exist_key => $exist_language){
                    $user_valid_custom_language[$exist_key] = $exist_language;
                }

                foreach($admin_valid_new_languages as $new_key => $new_language){
                    $user_valid_custom_language[$new_key] = $new_language;
                }

                file_put_contents($lang_file, "<?php\n return " . var_export($user_valid_custom_language, true) . ";\n");
            }
        }

        // admin validation file lang


        // user blade file lang
        $user_custom_language = [];
        $user_new_languages = include('lang/en/user.php');

        foreach ($dynamic_lang_dir as $lang_dir) {

            $lang_file = $lang_dir . '/user.php';

            if (file_exists($lang_file)) {

                $user_existing_languages = include $lang_file;

                foreach($user_existing_languages as $exist_key => $exist_language){
                    $user_custom_language[$exist_key] = $exist_language;
                }

                foreach($user_new_languages as $new_key => $new_language){
                    $user_custom_language[$new_key] = $new_language;
                }

                file_put_contents($lang_file, "<?php\n return " . var_export($user_custom_language, true) . ";\n");
            }
        }

        // user blade file lang

        $this->message([
            'type' => 'success',
            'msg' => "Language Generated Successfully"
        ]);
    }


    public function message($msg){
        echo json_encode($msg);
    }

}

new Updator();

