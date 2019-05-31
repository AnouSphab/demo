# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!
inhibit_all_warnings!

workspace 'TestMarcel'

def discover_frameworks
    modules = %x(cd Frameworks; ls -d -- *).strip.split("\n")
    modules
end

def set_shared_pods
  pod 'Alamofire', '~> 4.8.2'
end

def set_shared_test_pods

end

discover_frameworks.each do |f|
    target f do
        project 'Frameworks/%s/%s.xcodeproj' % [f, f]
        set_shared_pods
	      pod 'GoogleMaps'
        pod 'GooglePlaces'
    end
    target '%sTests' % [f] do
        project 'Frameworks/%s/%s.xcodeproj' % [f, f]
        set_shared_test_pods
    end
end


target 'TestMarcel' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestMarcel
  set_shared_pods


  target 'TestMarcelTests' do
    inherit! :search_paths
    # Pods for testing
    set_shared_pods
    set_shared_test_pods
    pod 'Nimble'
    pod 'Quick'
  end

end
