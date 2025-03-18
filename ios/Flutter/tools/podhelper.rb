def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "Generated.xcconfig must exist. Run 'flutter pub get' to generate it."
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1] if matches
  end
  raise "FLUTTER_ROOT not found in Generated.xcconfig"
end

def flutter_ios_podfile_setup
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end