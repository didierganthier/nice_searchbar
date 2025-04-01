# Changelog  

## [0.0.4] - 2025-04-01  
### Added  
- Introduced customizable `foldedWidth` and `unfoldedWidth` properties.  
- Added `foldedIcon` and `unfoldedIcon` for better visual customization.  
- Introduced `foldedIconColor` and `unfoldedIconColor` for more styling flexibility.  

### Changed  
- Updated the search bar to use `Theme.of(context).colorScheme.secondary` for hint text styling.  
- Improved animation smoothness and visual consistency.  

### Fixed  
- Fixed an issue where the search bar did not fold/unfold properly in certain cases.  

## [0.0.1] - 2025-03-31  
### Added  
- Initial release with animated expanding/collapsing search bar.  
- Customizable hint text.  
- `onChanged` callback for search input updates.  
- Optional `additionalFunction` when toggling the search bar.  
