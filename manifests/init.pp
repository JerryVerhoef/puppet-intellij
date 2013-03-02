# Public: Install IntelliJ IDEA to /Applications 
#
# Sample Usage:
#
#  class { 'intellij':
#    edition => 'community',
#  }
# 
class intellij($edition='community') {

  case $edition {
    'community': { 
      $edition_real = 'IU'
    }
    'ultimate': {
      $edition_real = 'IC'
    }
    default: {
      fail('Class[intellij]: parameter edition must be community or ultimate')
    }
  }

  package { 'IntelliJ':
    provider => 'appdmg',
    source   => "http://download.jetbrains.com/idea/idea${edition_real}-12.0.4.dmg",
  }

}