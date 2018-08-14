#!/usr/bin/env perl
use utf8;
use warnings;
use open qw/:encoding(UTF-8) :std/;
use Mojolicious::Lite;
use File::Basename;
use Encode qw(decode);
plugin 'RenderFile';


our $CD="/cd";
our $DOWNLOAD = '/download';
our $ROOT_DIR = &getRootPath(@ARGV);

get '/' => sub {
  my $self = shift;
  $self->redirect_to('/cd/');
};

get "$CD/:path2dir"=> [path2dir => qr/.*/] => sub {
  my $self = shift;
  my $path2dir = $self->param('path2dir');

  $path2dir = '/'.$path2dir unless $path2dir =~ m{^/.*};
  $path2dir .= '/' unless $path2dir =~ m{.*/$};
  #now $path2dir has format '/some_path/'

  if (-d $ROOT_DIR.$path2dir){
    opendir (my $serverPath, $ROOT_DIR.$path2dir) or die "CAN'T OPEN DIR";
    my @allFiles = sort readdir($serverPath);
    @allFiles = (@allFiles)[2..$#allFiles];#remove . and ..
    my @dirs;
    my @files;
    for(@allFiles){
      $_ = decode('utf8', $_);
       if (-d $ROOT_DIR.$path2dir.$_){
         push @dirs, [$_, $CD.$path2dir.$_];#[name, link]
       }else{
         push @files, [$_, $DOWNLOAD.$path2dir.$_];#[name, link]
       }
    }
    $self->render(template => "data", dirs => \@dirs, files => \@files, back_link => dirname($CD.$path2dir).'/');
  } else {
    $self->render(text => "Document '$path2dir' not  found");
  }

};

get "$DOWNLOAD/*:file" => sub {
  my $self = shift;
  my $file = $self->param('file');
  $self->render_file('filepath' => "$ROOT_DIR$file");
};

sub getRootPath {
	my $file = (map s/.*=//gr, grep m/^root=(.*)/, @_)[0] // die "Root dir is not initialized";
	$file .= "/" unless $file =~ m/\/$/;
	return $file;
}

app->start;
