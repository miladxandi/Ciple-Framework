script_folder="/mnt/d/Projects/C++/Ciple-Framework/conan/build/MinSizeRel/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-minsizerel-x86_64.sh"
for v in OPENSSL_MODULES
do
    is_defined="true"
    value=$(printenv $v) || is_defined="" || true
    if [ -n "$value" ] || [ -n "$is_defined" ]
    then
        echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-minsizerel-x86_64.sh"
    else
        echo unset $v >> "$script_folder/deactivate_conanrunenv-minsizerel-x86_64.sh"
    fi
done


export OPENSSL_MODULES="/home/miladxandi/.conan2/p/b/opens8885d365026ab/p/lib/ossl-modules"