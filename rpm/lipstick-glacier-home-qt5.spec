# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       lipstick-glacier-home-qt5

# >> macros
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}
Summary:    A nice homescreen for Glacier experience
Version:    0.26
Release:    1
Group:      System/GUI/Other
License:    BSD
URL:        https://github.com/locusf/glacier-home
Source0:    %{name}-%{version}.tar.bz2
Source1:    lipstick.desktop
Source100:  lipstick-glacier-home-qt5.yaml
Requires:   lipstick-qt5 >= 0.17.0
Requires:   nemo-qml-plugin-configuration-qt5
Requires:   nemo-qml-plugin-time-qt5
Requires:   qt5-qtdeclarative-import-window2
Requires:   qt5-qtquickcontrols-nemo
Requires:   nemo-qml-plugin-contextkit-qt5
Requires:   connman-qt5
Requires:   libqofono-qt5-declarative
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(lipstick-qt5) >= 0.12.0
BuildRequires:  pkgconfig(Qt5Compositor)
Conflicts:   lipstick-example-home

%description
A homescreen for Nemo Mobile

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qtc_qmake5 

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
#install -D -m 644 %{SOURCE1} %{buildroot}/etc/xdg/autostart/lipstick.desktop
#mkdir -p %{buildroot}%{_libdir}/systemd/user/user-session.target.wants/
#ln -s ../lipstick.service %{buildroot}%{_libdir}/systemd/user/user-session.target.wants/lipstick.service
# << install post

%files
%defattr(-,root,root,-)
%{_bindir}/lipstick
%{_libdir}/systemd/user/lipstick.service
%config /etc/xdg/autostart/*.desktop
%{_libdir}/systemd/user/user-session.target.wants/lipstick.service
%{_datadir}/lipstick-glacier-home-qt5/nemovars.conf
# >> files
# << files
