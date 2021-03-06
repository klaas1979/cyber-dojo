
# env vars can be set before running a test
# if they are not set they get their defaults
# at the end of each test the env vars are restored.

module TestExternalHelpers # mix-in

  module_function

  def setup   ; store_env_vars; check_tmp_root_exists; end
  def teardown; restore_env_vars; end

  def set_languages_root(value); cd_set(languages_key,value); end
  def set_exercises_root(value); cd_set(exercises_key,value); end
  def     set_katas_root(value); cd_set(    katas_key,value); end
  def    set_caches_root(value); cd_set(   caches_key,value); end

  def   set_runner_class(value); cd_set(   runner_key,value); end
  def     set_disk_class(value); cd_set(     disk_key,value); end
  def      set_git_class(value); cd_set(      git_key,value); end
  def set_one_self_class(value); cd_set( one_self_key,value); end

  def get_languages_root; cd_get(languages_key); end
  def get_exercises_root; cd_get(exercises_key); end
  def     get_katas_root; cd_get(    katas_key); end
  def    get_caches_root; cd_get(   caches_key); end

  def   get_runner_class; cd_get(   runner_key); end
  def     get_disk_class; cd_get(     disk_key); end
  def      get_git_class; cd_get(      git_key); end
  def get_one_self_class; cd_get( one_self_key); end

  # - - - - - - - - - - - - - - - - - - -

  def store_env_vars
    @store_env_vars_called = true
    @exported = {}
    @unset = []
    env_vars.each do |var, default|
      if ENV[var].nil?
        @unset << var
        ENV[var] = default
      else
        @exported[var] = ENV[var]
      end
    end
  end

  def restore_env_vars
    fail "store_env_vars() not called" if @store_env_vars_called.nil?
    @exported.each { |var, value| ENV[var] = @exported[var] }
    @exported = {}
    @unset.each { |var| ENV.delete(var) }
    @unset = []
  end

  def env_vars
    root_dir = File.expand_path('..', File.dirname(__FILE__))
    {
      languages_key => root_dir + '/languages',
      exercises_key => root_dir + '/exercises',
      katas_key     => root_dir + '/katas',
      caches_key    => root_dir + '/caches',
      disk_key      => 'HostDisk',
      runner_key    => 'DockerRunner',
      git_key       => 'HostGit',
      one_self_key  => 'OneSelfCurl'
    }
  end

  def languages_key; root('LANGUAGES'); end
  def exercises_key; root('EXERCISES'); end
  def     katas_key; root(    'KATAS'); end
  def    caches_key; root(   'CACHES'); end

  def      disk_key; klass('DISK'    ); end
  def    runner_key; klass('RUNNER'  ); end
  def       git_key; klass('GIT'     ); end
  def  one_self_key; klass('ONE_SELF'); end

  def root (key); cd(key + '_ROOT' ); end
  def klass(key); cd(key + '_CLASS'); end

  def cd_set(key,value); ENV[key] = value; end
  def cd_get(key); ENV[key] || env_vars[key]; end
  def cd(key); 'CYBER_DOJO_' + key; end

end
