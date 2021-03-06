
module DockerTestHelpers # mix-in

  module_function

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def stub_docker_images_python_pytest
    @bash.stub(docker_images_python_pytest, success)
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def stub_docker_run(output, exit_status)
    @bash.stub(output, exit_status);
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def cdf
    'cyberdojofoundation'
  end

  def docker_images_python_pytest
    [
      'REPOSITORY                                 TAG     IMAGE ID      CREATED        VIRTUAL SIZE',
      '<none>                                     <none>  b7253690a1dd  2 weeks ago    1.266 GB',
      "#{cdf}/python-3.3.5_pytest" +            ' latest  d9603e342b22  13 months ago  692.9 MB',
      '<none>                                     <none>  0ebf80aa0a8a  2 weeks ago    569.8 MB'
    ].join("\n")
  end

  def docker_images_python_pytest_and_ruby_testunit
    [
      'REPOSITORY                                 TAG     IMAGE ID      CREATED        VIRTUAL SIZE',
      '<none>                                     <none>  b7253690a1dd  2 weeks ago    1.266 GB',
      "#{cdf}/python-3.3.5_pytest" +            ' latest  d9603e342b22  13 months ago  692.9 MB',
      "#{cdf}/ruby_testtest" +                  ' latest  d9603e356721  12 months ago  591.7 MB',
      '<none>                                     <none>  0ebf80aa0a8a  2 weeks ago    569.8 MB'
    ].join("\n")
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def root_dir; File.expand_path('../..', File.dirname(__FILE__)); end

  def max_seconds; 5; end

  def completes; 0; end

  def times_out; fatal_error(kill); end

  def success; 0; end

  def kill; 9; end

  def fatal_error(signal); 128 + signal; end

end
