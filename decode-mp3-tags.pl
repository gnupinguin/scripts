#!/usr/bin/env perl
use 5.014;
use strict;
use warnings;
use utf8;
use open qw/:encoding(UTF-8) :std/;
use MP3::Tag;
use Encode qw(decode encode);

for (@ARGV){
  my $mp3 = MP3::Tag->new($_);
  my ($title, $track, $artist, $album, $comment, $year, $genre);
  ($title, $track, $artist, $album, $comment, $year, $genre) = $mp3->autoinfo();

# say join "\n", $title, $track, $artist, $album, $comment, $year, $genre;
  for my $op($title, $track, $artist, $album, $comment, $year, $genre){
    $op = decode("cp1251", $op) unless Encode::is_utf8($op);
  }


  $mp3->title_set($title);
  $mp3->track_set($track);
  $mp3->artist_set($artist);
  $mp3->album_set($album);
  $mp3->year_set($year);
  $mp3->genre_set($genre);

  $mp3->update_tags();
}
