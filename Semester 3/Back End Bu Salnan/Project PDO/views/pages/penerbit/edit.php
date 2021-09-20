<?php
session_start();
include('require.php');

$penerbit = new penerbit();

if(isset($_GET['data'])) {
    $id_penerbit = $_GET['data'];
    $_SESSION['kunci'] = $id_penerbit;
    $data = $penerbit->show($id_penerbit);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Penerbit</title>
</head>

<body>
<form method="post" action="konfirmasieditpenerbit.php">
        <table align="center" width="40%" border="1">
            <tr>
                <td colspan="3">
                    <a href="index.php">
                        <input type="button" value="kembali" />
                    </a>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <b colspan="3">
                        Form Edit Penerbit        
                    </b>
                </td>
            </tr>
            <tr>
                <td width="20%"> Penerbit </td>
                <td width="5%" align="center"> : </td>
                <td width="55%">
                    <input type="text" name="penerbit" value="<?php echo $data['penerbit']; ?>" />
                </td>
            </tr>
            <tr>
                <td width="20%"> Alamat </td>
                <td width="5%" align="center"> : </td>
                <td width="55%">
                    <input type="text" name="alamat" value="<?php echo $data['alamat']; ?>" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" name="edit" value="Edit" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>