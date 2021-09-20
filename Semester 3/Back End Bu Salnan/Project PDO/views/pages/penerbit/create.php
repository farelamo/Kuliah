<!DOCTYPE html>
<html>

<head>
    <title>Penerbit</title>
</head>

<body>
    <form method="post" action="konfirmasitambahpenerbit.php">
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
                        Form Tambah Penerbit        
                    </b>
                </td>
            </tr>
            <tr>
                <td width="20%"> Penerbit </td>
                <td width="5%" align="center"> : </td>
                <td width="55%">
                    <input type="text" name="penerbit" value="" />
                </td>
            </tr>
            <tr>
                <td width="20%"> Alamat </td>
                <td width="5%" align="center"> : </td>
                <td width="55%">
                    <input type="text" name="alamat" value="" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" name="tambah" value="Tambah" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>