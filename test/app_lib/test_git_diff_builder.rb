  test 'build chunk with space in its filename' do

    lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/file with_space b/sandbox/file with_space
      new file mode 100644
      index 0000000..21984c7
      --- /dev/null
      +++ b/sandbox/file with_space
      @@ -0,0 +1 @@
      +Please rename me!
      \\ No newline at end of file
    HERE
            'diff --git a/sandbox/file with_space b/sandbox/file with_space',
            'new file mode 100644',
            'index 0000000..21984c7',
                  :added_lines   => [ 'Please rename me!' ],
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      Please rename me!
    HERE
      { :type => :added,   :line => 'Please rename me!', :number => 1 },
  test 'build chunk with defaulted now line info' do
    lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/untitled_5G3 b/sandbox/untitled_5G3
      index e69de29..2e65efe 100644
      --- a/sandbox/untitled_5G3
      +++ b/sandbox/untitled_5G3
      @@ -0,0 +1 @@
      +a
      \\ No newline at end of file
    HERE
            'diff --git a/sandbox/untitled_5G3 b/sandbox/untitled_5G3',
            'index e69de29..2e65efe 100644'
                  :added_lines   => [ 'a' ],
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      a
    HERE
  test 'build two chunks with leading and trailing same lines ' +
       'and no newline at eof' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index b1a30d9..7fa9727 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -1,5 +1,5 @@
       1
      -2
      +2a
       3
       4
       5
      @@ -8,6 +8,6 @@
       8
       9
       10
      -11
      +11a
       12
       13
      \\ No newline at end of file
    HERE
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index b1a30d9..7fa9727 100644'
              :before_lines => [ '1' ],
                  :deleted_lines => [ '2' ],
                  :added_lines   => [ '2a' ],
                  :after_lines => [ '3', '4', '5' ]
              :before_lines => [ '8', '9', '10' ],
                  :deleted_lines => [ '11' ],
                  :added_lines   => [ '11a' ],
                  :after_lines => [ '12', '13' ]
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2a
      3
      4
      5
      6
      7
      8
      9
      10
      11a
      12
      13
    HERE
      { :line => '1', :type => :same, :number => 1 },
      { :line => '2', :type => :deleted, :number => 2 },
      { :line => '2a', :type => :added, :number => 2 },
      { :line => '3', :type => :same, :number => 3 },
      { :line => '4', :type => :same, :number => 4 },
      { :line => '5', :type => :same, :number => 5 },
      { :line => '6', :type => :same, :number => 6 },
      { :line => '7', :type => :same, :number => 7 },
      { :line => '8', :type => :same, :number => 8 },
      { :line => '9', :type => :same, :number => 9 },
      { :line => '10', :type => :same, :number => 10 },
      { :line => '11', :type => :deleted, :number => 11 },
      { :line => '11a', :type => :added, :number => 11 },
      { :line => '12', :type => :same, :number => 12 },
      { :line => '13', :type => :same, :number => 13 },
  test 'build two chunks first and last lines change ' +
       'and are 7 lines apart' do
    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 0719398..2943489 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -1,4 +1,4 @@
      -1
      +1a
       2
       3
       4
      @@ -6,4 +6,4 @@
       6
       7
       8
      -9
      +9a
    HERE
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 0719398..2943489 100644'
                  :deleted_lines => [ '1' ],
                  :added_lines   => [ '1a' ],
                  :after_lines => [ '2', '3', '4' ]
              :before_lines => [ '6', '7', '8' ],
                  :deleted_lines => [ '9' ],
                  :added_lines   => [ '9a' ],
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1a
      2
      3
      4
      5
      6
      7
      8
      9a
    HERE
      { :line => '1', :type => :deleted, :number => 1 },
      { :line => '1a', :type => :added, :number => 1 },
      { :line => '2', :type => :same, :number => 2 },
      { :line => '3', :type => :same, :number => 3 },
      { :line => '4', :type => :same, :number => 4 },
      { :line => '5', :type => :same, :number => 5 },
      { :line => '6', :type => :same, :number => 6 },
      { :line => '7', :type => :same, :number => 7 },
      { :line => '8', :type => :same, :number => 8 },
      { :line => '9', :type => :deleted, :number => 9 },
      { :line => '9a', :type => :added, :number => 9 },
  test 'build one chunk with two sections ' +
       'each with one line added and one line deleted' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 535d2b0..a173ef1 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -1,8 +1,8 @@
       1
       2
      -3
      +3a
       4
      -5
      +5a
       6
       7
       8
    HERE
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3a
      4
      5a
      6
      7
      8
    HERE
  test 'build one chunk with one section with only lines added' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 06e567b..59e88aa 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -1,6 +1,9 @@
       1
       2
       3
      +3a1
      +3a2
      +3a3
       4
       5
       6
    HERE
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3
      3a1
      3a2
      3a3
      4
      5
      6
      7
    HERE
  test 'build one chunk with one section with only lines deleted' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 0b669b6..a972632 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -2,8 +2,6 @@
       2
       3
       4
      -5
      -6
       7
       8
       9
    HERE
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3
      4
      7
      8
      9
      10
    HERE
  test 'build one chunk with one section ' +
       'with more lines deleted than added' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 08fe19c..1f8695e 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -3,9 +3,7 @@
       3
       4
       5
      -6
      -7
      -8
      +7a
       9
       10
       11
    HERE
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 08fe19c..1f8695e 100644'
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3
      4
      5
      7a
      9
      10
      11
      12
    HERE
      { :line => "6", :type => :deleted, :number =>  6 },
      { :line => "7", :type => :deleted, :number =>  7 },
      { :line => "8", :type => :deleted, :number =>  8 },
      { :line => "7a",:type => :added,   :number =>  6 },
      { :line => "9", :type => :same,    :number =>  7 },
      { :line => "10",:type => :same,    :number =>  8 },
      { :line => "11",:type => :same,    :number =>  9 },
      { :line => "12",:type => :same,    :number => 10 },
  test 'build one chunk with one section ' +
       'with more lines added than deleted' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 8e435da..a787223 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -3,7 +3,8 @@
       3
       4
       5
      -6
      +6a
      +6b
       7
       8
       9
    HERE
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 8e435da..a787223 100644'
              :before_lines => [ '3', '4', '5' ],
                  :deleted_lines => [ '6' ],
                  :added_lines   => [ '6a', '6b' ],
                  :after_lines => [ '7', '8', '9' ]
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3
      4
      5
      6a
      6b
      7
      8
      9
      10
      11
      12
      13
    HERE
      { :line => '1', :type => :same, :number => 1 },
      { :line => '2', :type => :same, :number => 2 },
      { :line => '3', :type => :same, :number => 3 },
      { :line => '4', :type => :same, :number => 4 },
      { :line => '5', :type => :same, :number => 5 },
      { :line => '6', :type => :deleted, :number =>  6 },
      { :line => '6a',:type => :added,   :number =>  6 },
      { :line => '6b',:type => :added,   :number =>  7 },
      { :line => '7', :type => :same,    :number =>  8 },
      { :line => '8', :type => :same,    :number =>  9 },
      { :line => '9', :type => :same,    :number => 10 },
      { :line => '10',:type => :same,    :number => 11 },
      { :line => '11',:type => :same,    :number => 12 },
      { :line => '12',:type => :same,    :number => 13 },
      { :line => '13',:type => :same,    :number => 14 },
  test 'build one chunk with one section ' +
       'with one line deleted and one line added' do

    diff_lines = <<-HERE.gsub(/^ {6}/,'')
      diff --git a/sandbox/lines b/sandbox/lines
      index 5ed4618..aad3f67 100644
      --- a/sandbox/lines
      +++ b/sandbox/lines
      @@ -5,7 +5,7 @@
       5
       6
       7
      -8
      +8a
       9
       10
       11
    HERE
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 5ed4618..aad3f67 100644'
              :before_lines => [ '5', '6', '7' ],
                  :deleted_lines => [ '8' ],
                  :added_lines   => [ '8a' ],
                  :after_lines => [ '9', '10', '11' ]
    source_lines = <<-HERE.gsub(/^ {6}/,'')
      1
      2
      3
      4
      5
      6
      7
      8a
      9
      10
      11
      12
      13
    HERE
      '1', '2', '3', '4', '5', '6', '7', '8a', '9', '10', '11', '12', '13'
      { :line => '1', :type => :same, :number => 1 },
      { :line => '2', :type => :same, :number => 2 },
      { :line => '3', :type => :same, :number => 3 },
      { :line => '4', :type => :same, :number => 4 },
      { :line => '5', :type => :same, :number => 5 },
      { :line => '6', :type => :same, :number => 6 },
      { :line => '7', :type => :same, :number => 7 },
      { :line => '8', :type => :deleted, :number =>  8 },
      { :line => '8a',:type => :added,   :number =>  8 },
      { :line => '9', :type => :same,    :number =>  9 },
      { :line => '10',:type => :same,    :number => 10 },
      { :line => '11',:type => :same,    :number => 11 },
      { :line => '12',:type => :same,    :number => 12 },
      { :line => '13',:type => :same,    :number => 13 },
  test 'count added and deleted lines' do
      { :line => '1', :type => :same,    :number =>  1 },
      { :line => '2', :type => :same,    :number =>  2 },
      { :line => '3', :type => :same,    :number =>  3 },
      { :line => '4', :type => :same,    :number =>  4 },
      { :line => '5', :type => :same,    :number =>  5 },
      { :line => '6', :type => :same,    :number =>  6 },
      { :line => '7a',:type => :added,   :number =>  7 },
      { :line => '8', :type => :deleted, :number =>  8 },
      { :line => '8a',:type => :added,   :number =>  8 },
      { :line => '9', :type => :same,    :number =>  9 },
      { :line => '10',:type => :same,    :number => 10 },
      { :line => '11',:type => :same,    :number => 11 },
      { :line => '12',:type => :same,    :number => 12 },
      { :line => '13',:type => :same,    :number => 13 },
    assert_equal 2, diff.count { |e| e[:type] == :added   }