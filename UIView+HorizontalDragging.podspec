Pod::Spec.new do |s|
    s.name            = 'UIView+HorizontalDragging'
    s.version         = '1.0'
    s.platform        = :ios, '7.0'
    s.license         = 'MIT'
    s.summary         = 'UIView+HorizontalDragging for your iOS app.'
    s.homepage        = 'https://github.com/zarochintsev/UIView-HorizontalDragging'
    s.authors         = { 'Alex Zarochintsev' => 'alex.zarochintsev@icloud.com' }
    s.source          = { :git => 'https://github.com/zarochintsev/UIView-HorizontalDragging', :tag => "1.0" }

    s.source_files    = 'UIView+HorizontalDragging/*.{h,m}'
    s.framework       = 'UIKit'
    s.requires_arc    = true
end